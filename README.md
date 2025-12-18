# Домашнее задание: Snakemake workflow в Docker
## Запуск проекта
Должен быть установлен Docker, код запускать через wsl/Linux
Нужно поочередно запустить эти команды:
```bash
cd python-homework-git
docker build -t homework .
docker run --rm -v $(pwd):/workspace homework
cat results/output.txt #выводит результат
```
## Результат
Создается файл ```results/output.txt``` с таблицей умножения на 7.
### Вот как должен выглядеть вывод:
```txt
Таблица умножения на 7:
7 × 1 = 7
7 × 2 = 14
7 × 3 = 21
7 × 4 = 28
7 × 5 = 35
7 × 6 = 42
7 × 7 = 49
7 × 8 = 56
7 × 9 = 63
7 × 10 = 70
```
## Файлы проекта
```Dockerfile```
```Snakefile```
```scripts/simple_script.py```
```.gitignore```
```README.md```