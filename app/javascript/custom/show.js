document.addEventListener("DOMContentLoaded", () => {
  const flameShowDiv = document.querySelector(".flame-show");

  if (flameShowDiv) {
    // Add canvas and set context
    const canvas = flameShowDiv.querySelector(".particle-canvas");
    const ctx = canvas.getContext("2d");

    // Resize canvas to match flameShowDiv
    canvas.width = flameShowDiv.offsetWidth;
    canvas.height = flameShowDiv.offsetHeight;

    let particlesArray = [];

    class Particle {
      constructor(x, y, size) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.weight = (Math.random() * 1.5) + 1.5;
        this.directionX = Math.random() * 2 - 1;
      }
      update() {
        this.weight -= 0.01;
        this.y -= this.weight;
        this.x += this.directionX;
        if (this.size >= 0.3) this.size -= 0.2;
      }
      draw() {
        ctx.beginPath();
        ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
        ctx.fillStyle = "orange";
        ctx.fill();
      }
    }

    function generateParticles() {
      console.log("Generating particles");
      for (let i = 0; i < 3; i++) {
        let size = Math.random() * 20 + 5;
        let x = Math.random() * canvas.width;
        let y = canvas.height - Math.random() * 50; // Spawn particles near the bottom
        particlesArray.push(new Particle(x, y, size));
      }
    }

    function handleParticles() {
      for (let i = 0; i < particlesArray.length; i++) {
        particlesArray[i].update();
        particlesArray[i].draw();
        if (particlesArray[i].size <= 1) {
          particlesArray.splice(i, 1);
          i--;
        }
      }
    }

    function animateParticles() {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      generateParticles();
      handleParticles();
      requestAnimationFrame(animateParticles);
    }

    animateParticles();

    // Resize canvas on window resize
    window.addEventListener("resize", () => {
      canvas.width = flameShowDiv.offsetWidth;
      canvas.height = flameShowDiv.offsetHeight;
    });
  }
});
