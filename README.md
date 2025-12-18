# Домашнее задание: Snakemake workflow в Docker
## Запуск проекта
```bash
docker build -t homework .
docker run --rm -v $(pwd):/workspace homework
cat results/output.txt
```
## Результат
Создается файл ```results/output.txt``` с текстом.
## Файлы проекта
- ```Dockerfile```
- ```Snakefile```
- ```scripts/simple_script.py```
- ```.gitignore```