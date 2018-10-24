-- Ler os dados
ratings = LOAD '/user/maria_dev/u.data' AS (
    userID:int,
    movieID:int,
    rating:int,
    ratingTime:int
    );
movies = LOAD '/user/maria_dev/u.item' USING PigStorage('|') AS (
    movieID:int,
    movieTitle:chararray,
    dateRelease:chararray,
    videoRelease: chararray,
    link: chararray
    );
-- Agrupar os filmes
ratingsByMovie = GROUP ratings BY movieID;
-- Calcular a media
avgRatings = FOREACH ratingsByMovie GENERATE group AS movieID, AVG(ratings.rating) AS avgRating;
-- Pegar os que são acima de 3.0
moviesChosens = FILTER avgRatings BY avgRating > 3.0;
-- Join
moviesJoin = JOIN moviesChosens BY movieID, movies BY movieID;
-- Seleciona os campos que queremos
moviesFieldsSelected = FOREACH moviesJoin GENERATE (int) moviesChosens::movieID AS movie_id, (chararray) movieTitle AS title, (double) avgRating AS average_rating;
-- Ordenar decrescentemente
results = ORDER moviesFieldsSelected BY average_rating DESC;
-- Exibir resultado
STORE results INTO 'projeto_import_pig' USING org.apache.hive.hcatalog.pig.HCatStorer();