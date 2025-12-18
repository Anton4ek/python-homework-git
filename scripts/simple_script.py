print("Запуск скрипта...")
result = "Таблица умножения на 7:\n"
for i in range(1,11):
    result += f"7 × {i} = {7 * i}\n"
with open("results/output.txt", "w") as f:
    f.write(result)
print("Скрипт завершен!")
print("Результаты сохранены в файле output.txt")