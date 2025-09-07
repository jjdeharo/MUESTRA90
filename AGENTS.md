# Repository Guidelines

## Project Structure & Module Organization
- Root files: `muestreo.R` (core function `muestreo()`), `README.md`, RStudio project (`*.Rproj`), and a supporting PDF.
- Temporary/IDE files are ignored: `.Rproj.user/`, `.Rhistory`, `.RData` (see `.gitignore`).
- If adding more functions, prefer creating an `R/` folder (one function per file) and, if needed, a `tests/` folder for checks.

## Build, Test, and Development Commands
- Run quick example (non-interactive):
  - `Rscript -e 'source("muestreo.R"); muestreo(c(5,3,2,1))'`
- Interactive session:
  - `R --vanilla` then `source("muestreo.R"); muestreo(c(5,3,2,1))`
- Dependencies: uses base R (incl. `stats::lm`). No extra packages required.

## Coding Style & Naming Conventions
- Language: R. Indentation: 2 spaces; no tabs.
- Line width: aim for ≤ 100 chars; wrap long expressions.
- Naming: functions and files in lower_snake_case (e.g., `calcular_metricas.R`); constants in ALL_CAPS only when truly constant.
- Side effects: keep pure functions; return values via `return(...)` and minimize `print/cat` in library code. If user-facing, gate prints with a `verbose` flag.

## Testing Guidelines
- Create lightweight reproducible checks in `tests/` (e.g., `tests/test_muestreo.R`).
- Example structure check:
  - `stopifnot(is.list(res), all(c("PX","W","Hip1","Hip") %in% names(res)))`
- Run tests ad hoc with `Rscript tests/test_muestreo.R` or interactively in R.

## Commit & Pull Request Guidelines
- Commits: short, imperative Spanish/English summary (≤ 72 chars). Examples: `Ajusta cálculo de PX1` / `Refactor muestreo() logging`.
- Group related changes; avoid mixing formatting with logic.
- PRs: include purpose, context, sample input/output, and steps to reproduce. Attach console output or screenshots if behavior changes.

## Security & Configuration Tips
- Do not commit large datasets or secrets. Keep `.Rhistory`, `.RData`, and `.Rproj.user/` untracked.
- Document any required R version in `README.md` if you introduce new features requiring it.

