// ==========================================
// 1) querySelector
// ==========================================
//
// A função mais IMPORTANTE JS que vamos usar \O/
//
// Como ele funciona?
// Muito simples, nós podemos usá-lo de algumas formas diferentes:
//
// document.querySelector('p')
// document.querySelector('.red')
// document.querySelector('#players')
//
// E ele retorna para a gente (e por isso podemos guardar numa variável, seja let ou const) o
// PRIMEIRO elemento HTML encontrado com o seu critério de busca!

const starWarsParagraph = document.querySelector('.red');

// ==========================================
// 2) getElementById
// ==========================================
//
// O getElementById é basicamente o querySelector('#o_tal_do_ID'), uma alternativa!
// Pode usar ele, ou pode usar sempre o querySelector.. Vcs que mandam ;)
const playersUl = document.getElementById('players');

// ==========================================
// 3) insertAdjacentHTML
// ==========================================
//
// É a melhor forma que temos de INSERIR código HTML dentro do DOM!
// A sintaxe é o_elemento_proximo_do_que_queremos_inserir.insertAdjacentHTML("a_opcao", "<div>o elemento em si</div>")
//
// Documentação: https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentHTML

playersUl.insertAdjacentHTML("beforeend", "<li>Darth Maul</li>");

// ==========================================
// 4) innerText & innerHTML
// ==========================================
//
// Você pode enxergar estas propriedades dos elementos do DOM como attr_readers e attr_writers do Ruby!
// Se você fizer elemento.innerText , você estará LENDO o texto dentro do elemento (entre as tags)
// Se você fizer elemento.innerHTML , você estará LENTO o HTML dentro do elemento (entre as tags)
//
// Agora..
// Se você fizer elemento.innerText = "algum texto", você MUDOU o texto dentro do elemento
// Se você fizer elemento.innerHTML = "<p>algum elemento HTML qualquer</p>", você MUDOU o HTML dentro do elemento

// Para ler no console o valor, sempre use console.log(o_que_voce_quer_ler)
console.log(playersUl.querySelector('.red').innerText);

playersUl.querySelector('.red').innerText = "Anakin";

// ==========================================
// 4) querySelectorAll
// ==========================================
//
// Funciona da mesma forma que o querySelector, a diferença é que retorna uma nodeList (tipo um array)
// com TODOS os elementos que atendem ao critério de busca.

// Aqui pegamos todos os li que são descendentes do elemento cujo id é fifa-wins
const winningCountries = document.querySelectorAll('#fifa-wins li');

// Podemos fazer um forEach sobre a nodeList, exatamente como se fosse um array!
winningCountries.forEach((countryLi) => {
  console.log(countryLi); // countryLi é o próprio elemento li
  console.log(countryLi.innerText); // countryLi.innerText é o texto do li
  // countryLi.style.color = "purple"; // próxima parte da documentação é sobre o style :D
});

// ==========================================
// 4) style
// ==========================================
//
// Esta é a forma que temos de modificar o estilo de um elemento!
// Podemos fazer o_elemento.style.fontSize = "14px" ou então o_elemento.style.color = "purple" ..
// E por aí vai (; Todas as proriedades de CSS estão disponíveis após o style, e você as acessa
// com lowerCamelCase, como style.fontSize
//

winningCountries.forEach((countryLi) => {
  countryLi.style.color = "purple"; // Acabamos de botar cada li de país campeão de Copa do Mundo com a cor roxa!
});

// Para esconder um elemento, você pode fazer:
starWarsParagraph.style.display = "none";

// E para fazê-lo re-aparecer no DOM, é só fazer esse outro caminho:
starWarsParagraph.style.display = "";

// ==========================================
// 5) classList
// ==========================================
//
// As vezes você já tem umas classes CSS com o estilo desejado.. Então daria um trabalhão ficar trocando
// o style do elemento mil vezes, né? Tudo bem, nós podemos simplesmente adicionar ou remover uma classe CSS
// do elemento!

// Adicionamos a classe minha-nova-classe-css ao parágrafo!
starWarsParagraph.classList.add("minha-nova-classe-css");

// Removemos a classe minha-nova-classe-css do parágrafo!
starWarsParagraph.classList.remove("minha-nova-classe-css");

// As vezes, você quer adicionar a classe SE ela não existe no elemento.
// E SE ela já existe, você quer removê-la.
//
// Para isso, temos o classList.toggle

starWarsParagraph.classList.toggle("minha-nova-classe-css");

// ==========================================
// 6) value
// ==========================================
//
// Quando você está manipulando inputs no DOM, innerText e innerHTML não fazem o que queremos..
// Para isso temos a propriedade value.

const emailInput = document.querySelector('#email');

// Para ler o valor que foi digitado dentro do input, fazemos:
emailInput.value

// Para mudar o valor do input, fazemos:
emailInput.value = "Meu novo valor";

// ==========================================
// 7) dataset
// ==========================================
//
// Vocês entenderão melhor no futuro o porque de data-attributes em um elemento HTML..
// Basicamente, é útil quando queremos disponibilizar mais informação sobre um elemento para o JS
// utilizá-la de alguma forma.

// Como funciona?
// Primeiro, no HTML, em um elemento como esse aqui: <div id="name">Matheus Penchel</div>
// Nós modificamos ele, para que fique assim <div id="name" data-banda-favorita="Mastodon" data-time="Botafogo">Matheus Penchel</div>

const matheusDiv = document.querySelector('#name');

// Para acessar as informações do dataset, fazemos assim:
matheusDiv.dataset.bandaFavorita
matheusDiv.dataset.time

// ==========================================
// 8) addEventListener
// ==========================================
//
// Aqui tudo começa a fazer sentido! Tudo que aprendemos até agora são ferramentas que utilizaremos
// para trabalhar com eventos.

// Como preparar um addEventListener? Sempre faça três perguntas:

// 1) Quais os elementos relevantes para o meu evento? Devemos capturá-los!!

const itemToBeExcluded = document.querySelector('#name');
const deleteButton = document.querySelector('#excluir');

// 2) Quando que algo deve acontecer? Qual evento que estamos escutando?

deleteButton.addEventListener("click", (event) => {
  // 3) O quê deve acontecer?
  itemToBeExcluded.style.display = "none";

  // Este local do código é um CALLBACK, ou seja, um código que só será executado
  // no futuro, em uma situação muito especial. Neste caso, será executado sempre que clicarmos
  // no elemento deleteButton.
})

// Livecode dos Slides
// 1) Quais os elementos relevantes para o meu evento?
const images = document.querySelectorAll('img');

images.forEach((img) => {
  // 2) Quando que algo deve acontecer? Qual evento que estamos escutando?
  img.addEventListener('click', (event) => {
    // 3) O quê deve acontecer?
    img.classList.toggle('img-circle');
  })
})