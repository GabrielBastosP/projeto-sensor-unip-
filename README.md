# Câmara Térmica Compacta — Seminário Integrador / Infor (UNIP 2026)

Pôster e artigos do projeto integrador de Engenharia de Computação, escritos em LaTeX no VS Code.

> O **pôster** é do grupo. Os **artigos são individuais** (cada um entrega o seu): os que estão aqui são do Gabriel.
> Para fazer o seu, copie a pasta do artigo para `artigo-1-microcontroladores-SEUNOME/` e troque o autor no `main.tex`.

| Pasta | O que é | Entrega |
|---|---|---|
| `poster/` | Pôster A0 (layout do pôster de referência do IEAv) | Prévia 23/10 e defesa final |
| `artigo-1-microcontroladores/` | Artigo individual 1 — ênfase em **microcontroladores** (ESP32: ADC, LEDC/PWM, firmware, light sleep) | Final (NP2) |
| `artigo-2-sistemas-digitais/` | Artigo individual 2 — ênfase em **sistemas digitais** (quantização, filtro, PWM, PI discreto, máquina de estados) | Final (NP2) |
| `entregas/` | PDFs finais de cada entrega | — |
| `modelos/` | Pôster e artigo de exemplo (SBSR) usados como referência de layout | — |

Tudo que aparece em **vermelho** no PDF está dentro de `\pendente{...}` e ainda falta preencher.
Quadros cinza = figura que ainda não foi colocada na pasta.

---

## 1. Primeira vez (cada integrante faz uma vez)

1. Baixe só o arquivo **`instalar-ambiente.bat`** deste repositório (abra o arquivo no GitHub → botão *Download raw file*).
2. Dê dois cliques nele. Ele instala **MiKTeX + Git + VS Code + LaTeX Workshop**, pede seu nome/e-mail do GitHub e o link do repositório, clona em `Documentos\` e abre no VS Code.
3. Na primeira compilação o MiKTeX baixa os pacotes que faltam — demora um pouco só dessa vez.

> Se der erro de `pdflatex não encontrado`, feche e abra o VS Code de novo.

## 2. Dia a dia (IMPORTANTE para não dar conflito)

1. **Antes de começar:** clique em **Sync** (setinhas ↻ na barra azul de baixo) para puxar o que o grupo fez.
2. Abra o `.tex` da sua parte — o PDF abre do lado e atualiza sozinho a cada salvamento.
3. **Ao terminar:** aba *Source Control* (Ctrl+Shift+G) → escreva o que mudou (ex.: `Resultados do degrau`) → **Commit** → **Sync**.

Regras do grupo:

- Cada um edita **o seu arquivo** (tabela abaixo). Duas pessoas no mesmo arquivo ao mesmo tempo = conflito.
- Faça commits pequenos e frequentes (no fim de cada sessão, no mínimo).
- PDFs gerados **não** vão para o Git (cada um compila o seu). O PDF oficial de cada entrega vai em `entregas/`.

## 3. Quem edita o quê

| Arquivo | Responsável |
|---|---|
| `poster/main.tex` (título, autores, logos) | Gabriel |
| `poster/secoes/01-motivacao-introducao.tex` | _definir_ |
| `poster/secoes/02-solucao-proposta.tex` | _definir_ |
| `poster/secoes/03-metodologia.tex` | _definir_ |
| `poster/secoes/04-resultados.tex` | _definir_ |
| `poster/secoes/05-consideracoes-finais.tex` + `06-referencias.tex` | _definir_ |
| `artigo-1-microcontroladores/` | Gabriel |
| `artigo-2-sistemas-digitais/` | Gabriel |

## 4. Figuras

- Pôster: `poster/figuras/` e `poster/logos/`. Artigos: `artigo-X/figures/`.
- Use **exatamente** o nome que aparece no quadro cinza (ex.: `figures/step-response.png`).
- Fotos em **.jpg** (~2000 px de largura); gráficos e prints em **.png**.
- Comando: `\imagem[largura][altura]{figures/arquivo.png}` — encaixa sem distorcer.

## 5. Referências dos artigos (BibTeX)

- As referências ficam em `07_SBSR.bib` de cada artigo. No texto: `\cite{ogata2010}`.
- Ao **adicionar uma citação nova**, rode uma vez a receita completa: ícone **TEX** na barra
  lateral → *Build LaTeX project* → **Recipe: pdfLaTeX + BibTeX (referencias)**.
  Depois disso a compilação automática rápida já mostra a citação.

## 6. Entrega no Overleaf

O checklist pede os PDFs finais gerados no Overleaf. Na reta final:

1. Compacte a pasta (`poster/` ou `artigo-X/`) em `.zip`.
2. Overleaf → *New Project* → *Upload Project* → escolha o `.zip` → *Recompile*.
3. Baixe o PDF e salve em `entregas/`.

Não precisa de colaboradores no Overleaf para isso — uma pessoa só sobe e gera o PDF.

> **Formato SBSR:** os artigos usam um `sbsr.sty` recriado a partir do artigo de exemplo
> (A4, duas colunas, Times). Os comandos são os mesmos do template oficial do Overleaf
> (*Template for SBSR*), então se o professor exigir o arquivo oficial basta trocar o `sbsr.sty`.
