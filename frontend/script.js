document.addEventListener('DOMContentLoaded', function() {
    const categoriaContainer = document.getElementById('categoria-botoes');

    // Botão para todas as categorias
    const allButton = document.createElement('button');
    allButton.textContent = 'Todos';
    allButton.className = 'botao-todos';
    allButton.onclick = carregarTodosDonuts;
    categoriaContainer.appendChild(allButton);

    // Carregar categorias e criar botões
    fetch('http://localhost:3000/categorias')
        .then(response => response.json())
        .then(categorias => {
            categorias.forEach(categoria => {
                const btn = document.createElement('button');
                btn.textContent = categoria.nome_categoria;
                btn.onclick = () => filtrarDonuts(categoria.id_categoria);
                categoriaContainer.appendChild(btn);
            });
        });

    function carregarTodosDonuts() {
        fetch('http://localhost:3000/donuts')
            .then(response => response.json())
            .then(donuts => mostrarDonuts(donuts))
            .catch(error => console.error('Erro ao buscar os donuts:', error));
    }

    function filtrarDonuts(id_categoria) {
        fetch(`http://localhost:3000/donuts?id_categoria=${id_categoria}`)
            .then(response => response.json())
            .then(donuts => mostrarDonuts(donuts))
            .catch(error => console.error('Erro ao filtrar os donuts:', error));
    }

    function mostrarDonuts(donuts) {
        const container = document.getElementById('container-donuts');

        container.innerHTML = '';
        donuts.forEach(donuts => {
            const div = document.createElement('div');
            let preco = donuts.preco_donut;
            let precoFormatado = preco.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
            div.className = 'donuts';
            div.innerHTML = `
                <img src="img/${donuts.id_donut}.jpg" class="donuts-imagem">
                <h2>${donuts.nome_donut}</h2>
                <p>${donuts.descricao_donut}</p>
                <h3>Preço ${precoFormatado}</h3>
            `;
            container.appendChild(div);
        });
    }
    

    // Carrega todos os donuts inicialmente
    carregarTodosDonuts();
});
