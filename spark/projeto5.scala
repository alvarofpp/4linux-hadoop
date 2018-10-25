// Classe de caso de funcionário
case class Func_Class (ID_Func: Long, Nome: String, Cargo: String, Valor1: Long, Departamento: String, Valor2: Long)
// Carrega os dados dos funcionários
val Funcionarios = sc.textFile("/user/maria_dev/funcionarios2.txt").map(callDetail => callDetail.split(',')).map(attributes => Func_Class(attributes(0).toInt,attributes(1),attributes(2),attributes(3).toInt,attributes(4),attributes(5).toInt)).toDF()
// Selecionar os campos que queremos, agrupa e mostra
Funcionarios.groupBy($"Departamento").sum("Valor1", "Valor2").show()