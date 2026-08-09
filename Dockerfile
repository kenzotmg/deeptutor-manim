# Usa a imagem oficial do DeepTutor como base
FROM ghcr.io/hkuds/deeptutor:latest

# Muda para usuário root para instalar dependências do sistema
USER root

# Instala as dependências do sistema para Manim
RUN apt-get update && apt-get install -y \
    texlive-base \
    texlive-latex-extra \
    ffmpeg \
    pkg-config \
    libcairo2-dev \
    libpango1.0-dev \
    cmake \
    && rm -rf /var/lib/apt/lists/*

# Volta para o usuário não-root do DeepTutor
USER deeptutor

# Instala as dependências Python do Math Animator (Manim)
RUN pip install --no-cache-dir 'deeptutor[math-animator]'
