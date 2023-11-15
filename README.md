# SuaDieta
## LAB. ENG. SOFTWARE 2023-2

Aplicativo para geração de dietas baseadas nos gostos do usuário, tendo um papel de aconselhamento nutricional não-oficial para o usuário, e direcionando-o para o objetivo estabelecido pelo mesmo (ganhar massa, ganhar músculos, perder massa etc.)

###### OBS: Este aplicativo não possui a premissa de fornecer uma dieta real e que será feita pelo usuário. Todas as dietas gerada não são oficiais e o correto é procurar um especialista no assunto para fazer isto de forma correta e controlada. Agradecido.

## Cálculo e montagem das dietas

Para a montagem das dietas, usaremos a **fórmula de Mifflin-StJeor**, usando a taxa metabólica basal (ou TMB) como referência principal do cálculo. 

* TMB p/ homens = 10 * peso + 6.25 * altura − 5 * idade + 5
* TMB p/ mulheres = 10 * peso + 6.25 * altura − 5 * idade - 161

Após este cálculo, deve multiplicar o resultado do TMB pelo **nível de atividade física da pessoa em questão**, sendo: 

* 1.2 para sedentários 
* 1.5 para pessoas com atividade regular 
* 1.9 para pessoas muito ativas

e colocando este cálculo em código dentro de uma classe, ficaria algo como:

```
double calculateBMR(double weight, double height, double age, String gender) {
    return gender == 'M'
        ? 10 * weight + 6.25 * height - 5 * age + 5
        : 10 * weight + 6.25 * height - 5 * age - 161;
  }

  double calculateCalories(double bmr, double activityLevel) {
    return bmr * activityLevel;
  }
```


