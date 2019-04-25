---
layout: archive
title: "Minicurso - Introduction to GNU Radio"
permalink: /minicurso-gnuradio/
author_profile: true
redirect_from:
  - /resume
---

Olá! Se você está aqui é porque ficou interessado em SDR. Bem-vindo ao clube! Abaixo você encontra um link para a aparesentação "Introduction to GNU Radio". Além disso, é possível fazer o download dos exemplos apresentados. É possível que os exemplos abaixo não sejam 100% iguais aos apresentados uma vez que foram feitos antes do minicurso. 

Adicionalmente, considere esses dois links como referências sobre o assunto: [RTL-SDR](https://www.rtl-sdr.com/ "https://www.rtl-sdr.com/") e [Signal Wiki](https://www.sigidwiki.com/wiki/Signal_Identification_Guide "https://www.sigidwiki.com/wiki/Signal_Identification_Guide"). O primeiro link traz informações gerais do projeto RTL-SDR e similares. O segundo, uma biblioteca de sinais de rádio frequência (RF), muito interessante para amantes de Engenharia de RF.

### Apresentação

[Clique aqui para ter acesso aos slides](https://docs.google.com/presentation/d/1xaSPTh2_FIf2rsD2eFCphmPFn3f8amq8tYwvXWafOvM/edit?usp=sharing "link google slides")

### Exemplo 1: Analisador de espectro

[Clique aqui para baixar o .grc do analisador de espectro](https://avgsg.github.io/files/shortcourse-gnuradio/spectrum_analyser.grc "link .grc spectrum analyser")

### Exemplo 2: _My car hack_

[Clique aqui para baixar o .grc do _my car hack_](https://avgsg.github.io/files/shortcourse-gnuradio/car-hack.grc "link .grc my car hack")

Observe que o link contém a parte final. O sinal já foi gravado em um arquivo e está sendo reproduzido. Para gravar o sinal do controle do alarme, você pode utilizar o analisar do espectro e salvar a saída em um arquivo. Isso é feito através de blocos _file sink_. O controle de alarme automotivo no Brasil opera em 433.92 Mhz.

### Exemplo 3: Receptor FM

[Clique aqui para baixar o .grc do Receptor FM](https://avgsg.github.io/files/shortcourse-gnuradio/fm-receiver.grc "link .grc fm receiver")