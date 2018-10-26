# Cria a pasta
mkdir /home/maria_dev/solutions
# Roda o script (29534 rows)
pig -x tez /home/maria_dev/solutions/cleaned_total.pig
# Roda o script (495 rows)
pig -x tez /home/maria_dev/solutions/denver_total.pig
# Roda o script (29 rows)
pig -x tez /home/maria_dev/solutions/denver_late.pig