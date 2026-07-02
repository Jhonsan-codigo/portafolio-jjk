/* =====================================================
   JUJUTSU KAISEN - EFECTOS CORREGIDOS v3.0
   ===================================================== */

// =====================================================
// PRELOADER
// =====================================================
document.addEventListener('DOMContentLoaded', function() {
    const preloader = document.querySelector('.preloader-jjk');
    if (preloader) {
        setTimeout(() => {
            preloader.classList.add('hidden');
            setTimeout(() => preloader.remove(), 600);
        }, 1500);
    }
});

// =====================================================
// SISTEMA DE SONIDOS (Web Audio API)
// =====================================================
class JJKAudio {
    constructor() {
        this.ctx = null;
        this.initialized = false;
        this.masterGain = null;
    }

    init() {
        if (this.initialized) return;
        try {
            this.ctx = new (window.AudioContext || window.webkitAudioContext)();
            this.masterGain = this.ctx.createGain();
            this.masterGain.gain.value = 0.3;
            this.masterGain.connect(this.ctx.destination);
            this.initialized = true;
        } catch (e) {
            console.warn('Web Audio API no disponible');
        }
    }

    playHover() {
        if (!this.initialized) this.init();
        if (!this.ctx) return;
        const osc = this.ctx.createOscillator();
        const gain = this.ctx.createGain();
        const filter = this.ctx.createBiquadFilter();
        osc.type = 'sine';
        osc.frequency.setValueAtTime(200, this.ctx.currentTime);
        osc.frequency.exponentialRampToValueAtTime(500, this.ctx.currentTime + 0.15);
        filter.type = 'lowpass';
        filter.frequency.setValueAtTime(800, this.ctx.currentTime);
        filter.frequency.exponentialRampToValueAtTime(2000, this.ctx.currentTime + 0.15);
        gain.gain.setValueAtTime(0, this.ctx.currentTime);
        gain.gain.linearRampToValueAtTime(0.06, this.ctx.currentTime + 0.05);
        gain.gain.exponentialRampToValueAtTime(0.001, this.ctx.currentTime + 0.2);
        osc.connect(filter);
        filter.connect(gain);
        gain.connect(this.masterGain);
        osc.start(this.ctx.currentTime);
        osc.stop(this.ctx.currentTime + 0.2);
    }

    playClick() {
        if (!this.initialized) this.init();
        if (!this.ctx) return;
        const osc = this.ctx.createOscillator();
        const gain = this.ctx.createGain();
        const filter = this.ctx.createBiquadFilter();
        osc.type = 'triangle';
        osc.frequency.setValueAtTime(800, this.ctx.currentTime);
        osc.frequency.exponentialRampToValueAtTime(150, this.ctx.currentTime + 0.12);
        filter.type = 'highpass';
        filter.frequency.setValueAtTime(200, this.ctx.currentTime);
        gain.gain.setValueAtTime(0.1, this.ctx.currentTime);
        gain.gain.exponentialRampToValueAtTime(0.001, this.ctx.currentTime + 0.12);
        osc.connect(filter);
        filter.connect(gain);
        gain.connect(this.masterGain);
        osc.start(this.ctx.currentTime);
        osc.stop(this.ctx.currentTime + 0.12);
    }

    playSuccess() {
        if (!this.initialized) this.init();
        if (!this.ctx) return;
        const notes = [392.00, 493.88, 587.33, 783.99];
        const now = this.ctx.currentTime;
        notes.forEach((freq, i) => {
            const osc = this.ctx.createOscillator();
            const gain = this.ctx.createGain();
            const filter = this.ctx.createBiquadFilter();
            osc.type = 'sine';
            osc.frequency.setValueAtTime(freq, now + i * 0.12);
            filter.type = 'lowpass';
            filter.frequency.setValueAtTime(1500, now + i * 0.12);
            gain.gain.setValueAtTime(0, now + i * 0.12);
            gain.gain.linearRampToValueAtTime(0.08, now + i * 0.12 + 0.03);
            gain.gain.exponentialRampToValueAtTime(0.001, now + i * 0.12 + 0.4);
            osc.connect(filter);
            filter.connect(gain);
            gain.connect(this.masterGain);
            osc.start(now + i * 0.12);
            osc.stop(now + i * 0.12 + 0.4);
        });
    }

    playError() {
        if (!this.initialized) this.init();
        if (!this.ctx) return;
        const osc = this.ctx.createOscillator();
        const gain = this.ctx.createGain();
        const filter = this.ctx.createBiquadFilter();
        osc.type = 'sawtooth';
        osc.frequency.setValueAtTime(150, this.ctx.currentTime);
        osc.frequency.exponentialRampToValueAtTime(40, this.ctx.currentTime + 0.5);
        filter.type = 'lowpass';
        filter.frequency.setValueAtTime(600, this.ctx.currentTime);
        filter.frequency.exponentialRampToValueAtTime(100, this.ctx.currentTime + 0.5);
        gain.gain.setValueAtTime(0.12, this.ctx.currentTime);
        gain.gain.exponentialRampToValueAtTime(0.001, this.ctx.currentTime + 0.5);
        osc.connect(filter);
        filter.connect(gain);
        gain.connect(this.masterGain);
        osc.start(this.ctx.currentTime);
        osc.stop(this.ctx.currentTime + 0.5);
    }

    playDomain() {
        if (!this.initialized) this.init();
        if (!this.ctx) return;
        const duration = 2.5;
        const now = this.ctx.currentTime;
        const drone = this.ctx.createOscillator();
        const droneGain = this.ctx.createGain();
        drone.type = 'sine';
        drone.frequency.setValueAtTime(60, now);
        drone.frequency.exponentialRampToValueAtTime(30, now + duration);
        droneGain.gain.setValueAtTime(0, now);
        droneGain.gain.linearRampToValueAtTime(0.1, now + 0.5);
        droneGain.gain.linearRampToValueAtTime(0, now + duration);
        drone.connect(droneGain);
        droneGain.connect(this.masterGain);
        drone.start(now);
        drone.stop(now + duration);

        for (let i = 0; i < 8; i++) {
            const osc = this.ctx.createOscillator();
            const gain = this.ctx.createGain();
            const filter = this.ctx.createBiquadFilter();
            osc.type = i % 2 === 0 ? 'sine' : 'triangle';
            osc.frequency.setValueAtTime(80 + i * 50, now);
            osc.frequency.exponentialRampToValueAtTime(400 + i * 120, now + duration * 0.7);
            filter.type = 'bandpass';
            filter.frequency.setValueAtTime(200 + i * 100, now);
            filter.Q.setValueAtTime(5, now);
            gain.gain.setValueAtTime(0, now);
            gain.gain.linearRampToValueAtTime(0.04, now + 0.3 + i * 0.1);
            gain.gain.linearRampToValueAtTime(0, now + duration);
            osc.connect(filter);
            filter.connect(gain);
            gain.connect(this.masterGain);
            osc.start(now);
            osc.stop(now + duration);
        }

        const bufferSize = this.ctx.sampleRate * duration;
        const buffer = this.ctx.createBuffer(1, bufferSize, this.ctx.sampleRate);
        const data = buffer.getChannelData(0);
        for (let i = 0; i < bufferSize; i++) {
            data[i] = (Math.random() * 2 - 1) * 0.02;
        }
        const noise = this.ctx.createBufferSource();
        noise.buffer = buffer;
        const noiseGain = this.ctx.createGain();
        const noiseFilter = this.ctx.createBiquadFilter();
        noiseFilter.type = 'bandpass';
        noiseFilter.frequency.setValueAtTime(500, now);
        noiseFilter.frequency.exponentialRampToValueAtTime(2000, now + duration);
        noiseGain.gain.setValueAtTime(0, now);
        noiseGain.gain.linearRampToValueAtTime(0.03, now + 0.5);
        noiseGain.gain.linearRampToValueAtTime(0, now + duration);
        noise.connect(noiseFilter);
        noiseFilter.connect(noiseGain);
        noiseGain.connect(this.masterGain);
        noise.start(now);
    }

    playType() {
        if (!this.initialized) this.init();
        if (!this.ctx) return;
        const osc = this.ctx.createOscillator();
        const gain = this.ctx.createGain();
        osc.type = 'sine';
        osc.frequency.setValueAtTime(600, this.ctx.currentTime);
        gain.gain.setValueAtTime(0.02, this.ctx.currentTime);
        gain.gain.exponentialRampToValueAtTime(0.001, this.ctx.currentTime + 0.05);
        osc.connect(gain);
        gain.connect(this.masterGain);
        osc.start(this.ctx.currentTime);
        osc.stop(this.ctx.currentTime + 0.05);
    }
}

const jjkAudio = new JJKAudio();

// =====================================================
// PARTICULAS DE ENERGIA MALDITA - Canvas
// =====================================================
class CurseParticles {
    constructor() {
        this.canvas = document.createElement('canvas');
        this.canvas.className = 'particles-canvas';
        this.ctx = this.canvas.getContext('2d');
        this.particles = [];
        this.mouseX = 0;
        this.mouseY = 0;
        this.init();
    }

    init() {
        document.body.appendChild(this.canvas);
        this.resize();
        window.addEventListener('resize', () => this.resize());
        document.addEventListener('mousemove', (e) => {
            this.mouseX = e.clientX;
            this.mouseY = e.clientY;
        });

        for (let i = 0; i < 60; i++) {
            this.particles.push(this.createParticle());
        }

        this.animate();
    }

    resize() {
        this.canvas.width = window.innerWidth;
        this.canvas.height = window.innerHeight;
    }

    createParticle() {
        const colors = ['#8B0000', '#DC143C', '#FF1A1A', '#4a0000', '#660000', '#a50000'];
        return {
            x: Math.random() * this.canvas.width,
            y: Math.random() * this.canvas.height,
            size: Math.random() * 3 + 1,
            speedX: (Math.random() - 0.5) * 0.5,
            speedY: -Math.random() * 0.8 - 0.2,
            opacity: Math.random() * 0.5 + 0.2,
            color: colors[Math.floor(Math.random() * colors.length)],
            pulse: Math.random() * Math.PI * 2,
            pulseSpeed: Math.random() * 0.02 + 0.005
        };
    }

    animate() {
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);

        this.particles.forEach(p => {
            p.x += p.speedX + Math.sin(p.pulse) * 0.3;
            p.y += p.speedY;
            p.pulse += p.pulseSpeed;

            const dx = this.mouseX - p.x;
            const dy = this.mouseY - p.y;
            const dist = Math.sqrt(dx * dx + dy * dy);
            if (dist < 150) {
                p.x += dx * 0.001;
                p.y += dy * 0.001;
            }

            if (p.y < -10) {
                p.y = this.canvas.height + 10;
                p.x = Math.random() * this.canvas.width;
            }
            if (p.x < -10) p.x = this.canvas.width + 10;
            if (p.x > this.canvas.width + 10) p.x = -10;

            const currentOpacity = p.opacity * (0.5 + 0.5 * Math.sin(p.pulse));
            this.ctx.beginPath();
            this.ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
            this.ctx.fillStyle = this.hexToRgba(p.color, currentOpacity);
            this.ctx.shadowBlur = p.size * 3;
            this.ctx.shadowColor = p.color;
            this.ctx.fill();
        });

        requestAnimationFrame(() => this.animate());
    }

    hexToRgba(hex, alpha) {
        const r = parseInt(hex.slice(1, 3), 16);
        const g = parseInt(hex.slice(3, 5), 16);
        const b = parseInt(hex.slice(5, 7), 16);
        return `rgba(${r}, ${g}, ${b}, ${alpha})`;
    }
}

// =====================================================
// EFECTO HUMO/ENERGIA MALDITA - Canvas mejorado
// =====================================================
class CurseSmoke {
    constructor() {
        this.canvas = document.createElement('canvas');
        this.ctx = this.canvas.getContext('2d');
        this.particles = [];
        this.mouseX = 0;
        this.mouseY = 0;
        this.init();
    }

    init() {
        this.canvas.style.position = 'fixed';
        this.canvas.style.top = '0';
        this.canvas.style.left = '0';
        this.canvas.style.width = '100%';
        this.canvas.style.height = '100%';
        this.canvas.style.pointerEvents = 'none';
        this.canvas.style.zIndex = '2';
        document.body.appendChild(this.canvas);

        this.resize();
        window.addEventListener('resize', () => this.resize());

        document.addEventListener('mousemove', (e) => {
            this.mouseX = e.clientX;
            this.mouseY = e.clientY;
        });

        for (let i = 0; i < 40; i++) {
            this.particles.push(this.createParticle());
        }

        this.animate();
    }

    resize() {
        this.canvas.width = window.innerWidth;
        this.canvas.height = window.innerHeight;
    }

    createParticle() {
        const colors = ['#8B0000', '#DC143C', '#4a0000', '#FF1A1A', '#660000', '#8b5cf6'];
        return {
            x: Math.random() * this.canvas.width,
            y: Math.random() * this.canvas.height,
            size: Math.random() * 80 + 30,
            speedX: (Math.random() - 0.5) * 0.3,
            speedY: -Math.random() * 0.5 - 0.1,
            opacity: Math.random() * 0.04 + 0.01,
            color: colors[Math.floor(Math.random() * colors.length)],
            pulse: Math.random() * Math.PI * 2,
            pulseSpeed: Math.random() * 0.01 + 0.003,
            drift: Math.random() * 0.3
        };
    }

    animate() {
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);

        this.particles.forEach(p => {
            p.x += p.speedX + Math.sin(p.pulse) * p.drift;
            p.y += p.speedY;
            p.pulse += p.pulseSpeed;

            const dx = this.mouseX - p.x;
            const dy = this.mouseY - p.y;
            const dist = Math.sqrt(dx * dx + dy * dy);
            if (dist < 200) {
                p.x += dx * 0.0003;
                p.y += dy * 0.0003;
            }

            if (p.y < -p.size) {
                p.y = this.canvas.height + p.size;
                p.x = Math.random() * this.canvas.width;
            }
            if (p.x < -p.size) p.x = this.canvas.width + p.size;
            if (p.x > this.canvas.width + p.size) p.x = -p.size;

            const currentOpacity = p.opacity * (0.5 + 0.5 * Math.sin(p.pulse));
            const currentSize = p.size * (0.7 + 0.3 * Math.sin(p.pulse));

            const gradient = this.ctx.createRadialGradient(p.x, p.y, 0, p.x, p.y, currentSize);
            gradient.addColorStop(0, this.hexToRgba(p.color, currentOpacity));
            gradient.addColorStop(0.4, this.hexToRgba(p.color, currentOpacity * 0.3));
            gradient.addColorStop(1, 'transparent');

            this.ctx.beginPath();
            this.ctx.arc(p.x, p.y, currentSize, 0, Math.PI * 2);
            this.ctx.fillStyle = gradient;
            this.ctx.fill();
        });

        requestAnimationFrame(() => this.animate());
    }

    hexToRgba(hex, alpha) {
        const r = parseInt(hex.slice(1, 3), 16);
        const g = parseInt(hex.slice(3, 5), 16);
        const b = parseInt(hex.slice(5, 7), 16);
        return `rgba(${r}, ${g}, ${b}, ${alpha})`;
    }
}

// =====================================================
// EFECTO DE DOMINIO EXPANDIDO AL NAVEGAR
// =====================================================
function openDomain(url) {
    const domain = document.createElement('div');
    domain.className = 'jjk-domain-open';
    document.body.appendChild(domain);
    jjkAudio.playDomain();
    requestAnimationFrame(() => {
        domain.classList.add('active');
    });
    setTimeout(() => {
        window.location.href = url;
    }, 1000);
}

// =====================================================
// OBSERVER DE ANIMACIONES EN SCROLL
// =====================================================
class ScrollAnimator {
    constructor() {
        this.observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-visible');
                }
            });
        }, { threshold: 0.1 });
        this.init();
    }

    init() {
        const selectors = [
            '.semana-card', '.ejercicio-card', '.contact-card',
            '.about-photo', '.about-info', '.hero-content > *', '.stat-item'
        ];

        selectors.forEach(selector => {
            document.querySelectorAll(selector).forEach((el, i) => {
                el.style.opacity = '0';
                el.style.transform = 'translateY(30px)';
                el.style.transition = `all 0.6s ease ${i * 0.1}s`;
                this.observer.observe(el);
            });
        });
    }
}

const style = document.createElement('style');
style.textContent = `.animate-visible { opacity: 1 !important; transform: translateY(0) !important; }`;
document.head.appendChild(style);

// =====================================================
// EFECTO PARALLAX EN HERO
// =====================================================
class ParallaxEffect {
    constructor() {
        this.hero = document.querySelector('.hero-section');
        if (!this.hero) return;
        this.init();
    }

    init() {
        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            const rate = scrolled * 0.3;
            const content = this.hero.querySelector('.hero-content');
            if (content) {
                content.style.transform = `translateY(${rate * 0.5}px)`;
                content.style.opacity = Math.max(0, 1 - scrolled / 600);
            }
        });
    }
}

// =====================================================
// EFECTO DE BRILLO EN CARDS AL PASAR MOUSE
// =====================================================
class CardGlowEffect {
    constructor() { this.init(); }
    init() {
        document.querySelectorAll('.semana-card, .ejercicio-card, .jjk-card').forEach(card => {
            card.addEventListener('mousemove', (e) => {
                const rect = card.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                card.style.setProperty('--mouse-x', `${x}px`);
                card.style.setProperty('--mouse-y', `${y}px`);
            });
        });
    }
}

// =====================================================
// INICIALIZACION
// =====================================================
document.addEventListener('DOMContentLoaded', () => {
    // Solo inicializar particulas en desktop
    if (!window.matchMedia('(pointer: coarse)').matches) {
        new CurseParticles();
        new CurseSmoke();
    }

    new ScrollAnimator();
    new ParallaxEffect();
    new CardGlowEffect();

    // Audio en interacciones
    document.querySelectorAll('.jjk-btn, .semana-btn, .ejercicio-btn, a, button').forEach(el => {
        el.addEventListener('mouseenter', () => jjkAudio.playHover());
        el.addEventListener('click', () => jjkAudio.playClick());
    });

    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', () => {
            setTimeout(() => {
                const error = document.querySelector('.jjk-error');
                const result = document.querySelector('.jjk-result');
                if (error) jjkAudio.playError();
                else if (result) jjkAudio.playSuccess();
            }, 100);
        });
    });

    document.querySelectorAll('.jjk-input, input[type="number"]').forEach(input => {
        input.addEventListener('keydown', () => {
            if (Math.random() > 0.7) jjkAudio.playType();
        });
    });

    // Inicializar audio en primera interaccion
    const initAudio = () => {
        jjkAudio.init();
        document.removeEventListener('click', initAudio);
        document.removeEventListener('keydown', initAudio);
    };
    document.addEventListener('click', initAudio, { once: true });
    document.addEventListener('keydown', initAudio, { once: true });
});

window.jjkAudio = jjkAudio;
window.openDomain = openDomain;