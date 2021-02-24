import 'dart:math';

void main() {
  var pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  print('******************** DESAFIO ********************');
  print('');

  print('1 - Remover os duplicados');
  print('');

  var listaNova = pessoas.toSet();

  listaNova.forEach((e) => print(e));

  print('');
  print('------------------------------------------------------------');
  print('');

  print('2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino');
  print('');

  var totalMasculino = totalPessoasPorSexo(listaNova, 'Masculino');
  var totalFeminino = totalPessoasPorSexo(listaNova, 'Feminino');

  print('Total de pessoas do sexo Masculino é: $totalMasculino');
  print('Total de pessoas do sexo Feminino é: $totalFeminino');

  print('');
  print('------------------------------------------------------------');
  print('');

  print('3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos');
  print('    e mostre a quantidade de pessaos com mais de 18 anos');
  print('');

  var listaFiltrada = filtraPessoasMaioresDeIdade(listaNova);

  var totalMasculinoMaiorIdade =
      totalPessoasPorSexo(listaNova, 'Masculino', 18);

  var totalFemininoMaiorIdade = totalPessoasPorSexo(listaNova, 'Feminino', 18);

  listaFiltrada.forEach((e) => print(e));
  print('');
  print('Total de pessoas maiores de idade é: ${listaFiltrada.length}');
  print('Sexo Masculino é: $totalMasculinoMaiorIdade');
  print('Sexo Feminino é: $totalFemininoMaiorIdade');

  print('');
  print('------------------------------------------------------------');
  print('');

  print('4 - Encontre a pessoa mais velha');
  print('');

  var listaTransformada = listaFiltrada.map((e) => e.split('|')).toList();

  listaTransformada.sort((n1, n2) => n2[1].compareTo(n1[1]));

  var pesMaisVelha = listaTransformada.first;
  print(
    'A pessoa mais velha é ${pesMaisVelha[0]} com ${pesMaisVelha[1]} anos e é do sexo ${pesMaisVelha[2]}',
  );
}

int totalPessoasPorSexo(Set<String> lista, String sexo,
    [int idadeMaiorQue = 0]) {
  if (idadeMaiorQue < 0) idadeMaiorQue = 0;

  var total = 0;

  if (idadeMaiorQue == 0) {
    lista.forEach((e) {
      if (e.contains(sexo)) {
        total++;
      }
    });
  } else {
    var auxReg = <String>[];
    lista.forEach((e) {
      auxReg = e.split('|');
      if ((int.tryParse(auxReg[1]) ?? 0) > idadeMaiorQue) {
        if (auxReg[2] == sexo) {
          total++;
        }
      }
    });
  }

  return total;
}

Set<String> filtraPessoasMaioresDeIdade(Set<String> lista) {
  var auxLista = Set<String>();
  var auxReg = <String>[];

  lista.forEach((e) {
    auxReg = e.split('|');
    if ((int.tryParse(auxReg[1]) ?? 0) > 18) {
      auxLista.add(e);
    }
  });

  return auxLista;
}
