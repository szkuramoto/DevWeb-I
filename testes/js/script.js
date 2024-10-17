const icons = document.querySelectorAll('.floating-icon');

// Mover o ícone para uma posição aleatória na tela ao clicar
icons.forEach(icon => {
    icon.addEventListener('click', () => {
        const x = Math.random() * (window.innerWidth - 50); // 50 é a largura do ícone
        const y = Math.random() * (window.innerHeight - 50); // 50 é a altura do ícone

        icon.style.left = `${x}px`;
        icon.style.top = `${y}px`;
    });
});
