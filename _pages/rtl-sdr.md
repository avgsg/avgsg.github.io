---
layout: archive
title: "RTL-SDR"
permalink: /rtl-sdr/
author_profile: true
redirect_from:
  - /resume
---

Está página é destinada à assuntos relacionados à _Software Defined Radio_ (SDR) com foco no dispositivo RTL-SDR. As informações são baseadas no sistema operacional _Ubuntu_ 17.04.

Instalação GNU-Radio
======

GNU-Radio já é listado nos repositórios padrões do _Ubuntu_. Para instalá-lo, basta executar o camando abaixo.

`sudo apt install gnuradio`

_Driver_ RTL-SDR
======

As versões mais recentes do _Ubuntu_ já possuem os drivers necessários para utilização do RTL-SDR. O comando `lsusb` pode ser usado como _double check_. Basta verificar se o dispositivo RTL-SDR está listado corretamente na lista mostrada por `lsusb`.

Instalação Bloco RTL-2832 no GNU-Radio
======

Para simplificar, fiz um script .sh com todos os passos de instalação do bloco RTL-SDR no GNU-Radio. Você pode utilizá-lo, basta fazer o _download_ através [desse link](https://avgsg.github.io/files/install-rtlsdr.sh "link para script de instalação do RTL2832").

Após a instalação, o bloco _source_ RTL-2832 já estará disponível na interface GNU-Radio como mostra a imagem abaixo. É bom ressaltar que o GNU-Radio Companion deve ser reiniciado caso esteja aberto antes do fim dos passos acima. 

![alt text](https://avgsg.github.io/images/rtl2832_source.png "Busca RTL2832")

_Getting my hands dirty_
=======

É possível comprovar o funcionando do RTL-SDR através de um simples analisador de espectro. Para isso, execute o GNU-Radio Companion. Ele pode ser inicializado através da linha de comando `gnuradio-companion`. 

### Passo 1: Componentes

O analisador de espectro consiste em apenas 2 componentes:

1. RTL2832 Source
2. WX GUI FFT Sink

Ambos podem ser encontrados no menu de blocos à direita como ilustra a figura abaixo.

![alt text](https://avgsg.github.io/images/RTL-SDR/spectrum_analyser.png "Components do analisar de espectro")

### Passo 2: Variáveis

Há 2 blocos padrões em qualquer novo _flow graph_ do GNU-Radio. Eles são **Options** e **Variable**. É necessário alterar a configuração **Generate Options** do bloco **Options** para WX GUI. Isso deve ser feito uma vez que estamos utilizando components do tipo WX GUI (veja o componente 2 do passo anterior). Também vamos alterar o valor da variável **Variable**. Essa variável será nossa taxa de amostragem (_sample\_rate_) e será fixada em 2M, ou 2e6. 2M está próximo do limite de amostragem suportado por RTL-SDR. Esse valor permitirá uma janela de frequências maior no analisador de frequências. Por último, adicionar WX GUI Slider. Isso permitirá que alteremos a frequência central do analisador de espectro durante sua execução. Os valores de WX GUI Slider mostrados abaixo representam a faixa de frequências de estações de rádio FM [87.9 MHz - 107.9 MHz]. Iremos utilizar essa faixa para comprovar o funcionamento do RTL-SDR. O ID atribuido ao WX GUI Slider é freq.

Resumidamente:

1. `Options >> Generate Options = WX GUI`
2. `Variable >> Value = 2e6`
3. Add WX GUI Slider com a seguinte configuração:
	1. `ID = freq`
	2. `Default Value = 87.9e6`
	3. `Minimum = 87.9e6`
	4. `Maximum= 107.9e6`

As alterações podem ser feitas via caixa de diálogo de cada bloco. Basta um clique duplo sobre o bloco desejado.

### Passo 3: _Throtle_ (Opcional)

Apesar de não obrigatório, adicionar o bloco _Throtle_ é altamente recomentado para não comprometer no funcionamento do computador. Ele não é parte funcional do analisador de espectro. A função do _Throtle_ é apenas limitar o uso do CPU, não deixando que todo o processamento do computador seja destinado ao GNU-Radio Companion.

### Passo 4: Configurando RTL2832 Source e WX GUI FFT Sink

Apenas 2 valores serão alterados no RTL2832 Source, Sample Rate e Frequency. As variáveis _samp\_rate_ e freq devem ser atribuídas respectivamente. 

1. `Sample rate = samp_rate`
2. `Frequency = freq`

WX GUI FFT Sink possui configuração semelhante.

1. `Sample rate = samp_rate`
2. `Baseband Freq = freq`

### Passo 5: Conexões

Para conectar o RTL2832 Source ao WX GUI FFT Sink basta clicar na saída do primeiro e, logo após, na entrada do segundo. A configuração final deverá ser similar à figura abaixo.

![alt text](https://avgsg.github.io/images/RTL-SDR/spectrum_analyser_ready.png "Analisador de espectro final")

### Passo 6: _Run_

Agora, basta salvar e executar o projeto. A execução pode ser feita via seta verde no menu superior do GNU-Radio Companion. O resultado dependerá da disponibilidade de estações de rádio FM na região. No exemplo abaixo, é possível identificar duas estações de rádio. A primeira centrada em 88.7 MHz e a segunda, 89.5 MHz. A barra de rolagem superior pode ser utilizada para explorar as demais frequências definidas pela variável _freq_ (WX GUI Slider).

![alt text](https://avgsg.github.io/images/RTL-SDR/spectrum_analyser_result.png "Analisador de espectro final")
