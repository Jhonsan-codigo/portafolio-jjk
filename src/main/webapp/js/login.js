class CurseEnergyCanvas {
    constructor() {
        this.canvas = document.getElementById('curseCanvas');
        if (!this.canvas) return;
        this.ctx = this.canvas.getContext('2d');
        this.particles = [];
        this.mouseX = 0; this.mouseY = 0;
        this.init();
    }

    init() {
        this.resize();
        window.addEventListener('resize', () => this.resize());
        document.addEventListener('mousemove', (e) => {
            this.mouseX = e.clientX; this.mouseY = e.clientY;
        });
        for (let i = 0; i < 80; i++) this.particles.push(this.createParticle());
        this.animate();
    }

    resize() {
        this.canvas.width = window.innerWidth;
        this.canvas.height = window.innerHeight;
    }

    createParticle() {
        const colors = ['#8B0000', '#DC143C', '#FF1A1A', '#4a0000', '#660000', '#a50000', '#FF4500'];
        return {
            x: Math.random() * this.canvas.width,
            y: Math.random() * this.canvas.height,
            size: Math.random() * 3 + 0.5,
            speedX: (Math.random() - 0.5) * 0.8,
            speedY: (Math.random() - 0.5) * 0.8,
            opacity: Math.random() * 0.6 + 0.2,
            color: colors[Math.floor(Math.random() * colors.length)],
            pulse: Math.random() * Math.PI * 2,
            pulseSpeed: Math.random() * 0.02 + 0.005
        };
    }

    animate() {
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
        this.particles.forEach((p, i) => {
            p.x += p.speedX + Math.sin(p.pulse) * 0.3;
            p.y += p.speedY + Math.cos(p.pulse) * 0.2;
            p.pulse += p.pulseSpeed;
            if (p.x < 0 || p.x > this.canvas.width) p.speedX *= -1;
            if (p.y < 0 || p.y > this.canvas.height) p.speedY *= -1;
            const dx = this.mouseX - p.x, dy = this.mouseY - p.y;
            const dist = Math.sqrt(dx * dx + dy * dy);
            if (dist < 200) { p.x += dx * 0.002; p.y += dy * 0.002; }
            const currentOpacity = p.opacity * (0.5 + 0.5 * Math.sin(p.pulse));
            this.ctx.beginPath();
            this.ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
            this.ctx.fillStyle = this.hexToRgba(p.color, currentOpacity);
            this.ctx.shadowBlur = p.size * 4;
            this.ctx.shadowColor = p.color;
            this.ctx.fill();
            for (let j = i + 1; j < this.particles.length; j++) {
                const p2 = this.particles[j];
                const d = Math.sqrt((p.x - p2.x) ** 2 + (p.y - p2.y) ** 2);
                if (d < 120) {
                    this.ctx.beginPath();
                    this.ctx.moveTo(p.x, p.y);
                    this.ctx.lineTo(p2.x, p2.y);
                    this.ctx.strokeStyle = `rgba(139,0,0,${0.15 * (1 - d / 120)})`;
                    this.ctx.lineWidth = 0.5;
                    this.ctx.stroke();
                }
            }
        });
        requestAnimationFrame(() => this.animate());
    }

    hexToRgba(hex, alpha) {
        const r = parseInt(hex.slice(1, 3), 16);
        const g = parseInt(hex.slice(3, 5), 16);
        const b = parseInt(hex.slice(5, 7), 16);
        return `rgba(${r},${g},${b},${alpha})`;
    }
}

function createBackgroundParticles() {
    const container = document.getElementById('particles');
    if (!container) return;
    const colors = ['#8B0000', '#FF1A1A', '#DC143C', '#4a0000'];
    for (let i = 0; i < 30; i++) {
        const particle = document.createElement('div');
        particle.className = 'particle';
        const size = Math.random() * 6 + 2;
        particle.style.width = size + 'px';
        particle.style.height = size + 'px';
        particle.style.background = colors[Math.floor(Math.random() * colors.length)];
        particle.style.left = Math.random() * 100 + '%';
        particle.style.animationDuration = (Math.random() * 15 + 10) + 's';
        particle.style.animationDelay = (Math.random() * 10) + 's';
        particle.style.opacity = Math.random() * 0.4 + 0.1;
        particle.style.boxShadow = `0 0 ${size * 2}px ${particle.style.background}`;
        container.appendChild(particle);
    }
}

function togglePassword() {
    const input = document.getElementById('password');
    const icon = document.getElementById('eyeIcon');
    if (input.type === 'password') {
        input.type = 'text'; icon.className = 'fas fa-eye-slash';
    } else {
        input.type = 'password'; icon.className = 'fas fa-eye';
    }
}

document.addEventListener('DOMContentLoaded', () => {
    new CurseEnergyCanvas();
    createBackgroundParticles();

    const loginForm = document.getElementById('loginForm');
    const loginBtn = document.getElementById('loginBtn');
    if (loginForm) {
        loginForm.addEventListener('submit', (e) => {
            loginBtn.classList.add('loading');
            const card = document.getElementById('loginCard');
            card.style.transition = 'all 1s ease';
            card.style.transform = 'scale(1.05)';
            card.style.boxShadow = '0 0 100px rgba(139,0,0,0.5), 0 0 200px rgba(139,0,0,0.3)';
        });
    }

    const card = document.getElementById('loginCard');
    if (card) {
        document.addEventListener('mousemove', (e) => {
            const rect = card.getBoundingClientRect();
            const centerX = rect.left + rect.width / 2;
            const centerY = rect.top + rect.height / 2;
            const rotateX = (e.clientY - centerY) / 50;
            const rotateY = (e.clientX - centerX) / 50;
            card.style.transform = `perspective(1000px) rotateX(${-rotateX}deg) rotateY(${rotateY}deg)`;
        });
    }
});

window.togglePassword = togglePassword;