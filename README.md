# MUESTRA90

Calculadora y scripts para aplicar el modelo estadístico de muestreo faunístico descrito en “Un modelo estadístico para el muestreo faunístico”. Permite estimar W, decidir el avance del muestreo bajo dos hipótesis y calcular ejemplares suplementarios.

## Calculadora web
- Online (GitHub Pages): http://jjdeharo.github.io/MUESTRA90/
- Local: abre `index.html` en el navegador.

### Ejemplo rápido
1) Introduce frecuencias por especie (absolutas o relativas), separadas por comas o espacios. Ej.: `5, 3, 2, 1`.
2) Ajusta `P(X)` (error tipo I) si es necesario; por defecto `0.1`.
3) Pulsa “Calcular”. Verás:
- Ajuste: pendiente `b`, `W = e^b`, `R²`, especies `M` y total `N`.
- Hipótesis A (J grande): `P ≈ 1/W^M`, `P(X₀)`, `X`, ejemplares suplementarios y decisión (rechazar o no H0).
- Hipótesis B (queda 1 especie): `P(1)`, `P'(X₀)`, `X₁`, suplementarios y decisión (rechazar o no H2).

### Interpretación
- Ajuste exponencial: `R²` cercano a 1 y `W > 1` indican buen ajuste; si `W ≤ 1`, el modelo no es válido con los datos actuales.
- Decisiones: 
  - A) Rechaza H0 si `P(X₀) ≤ P(X)` (suficientes extracciones para “muchas especies restantes”).
  - B) Rechaza H2 si `P'(X₀) ≤ P(X)` (no queda ninguna especie); si no, extrae `X₁ − N` ejemplares y reevalúa.
- “Ejemplares suplementarios” = `max(0, X − N)`.

## Uso en R
```r
source("muestreo.R")
muestreo(c(5,3,2,1), PX=0.1, d=4)
```
- Entrada: frecuencias por especie (orden indiferente; el script las ordena).
- Salida: `W`, `Hip1` (A) y `Hip` (B) con `P`, `PX0`, `X` y sus análogas.

## Notas
- Introduce al menos 2 especies; idealmente más para un ajuste estable.
- Si añades funciones nuevas, sugiere colocarlas en `R/` y tests simples en `tests/`.
