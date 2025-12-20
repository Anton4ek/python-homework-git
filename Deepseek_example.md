#### Запрос:
```
Напиши функцию на python, которая будет создавать график стандартного распределения
```
#### Ответ:
Вот функция на Python для построения графика стандартного нормального распределения (среднее = 0, стандартное отклонение = 1) с использованием библиотек NumPy и Matplotlib:

```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

def plot_normal_distribution():
    """
    Создает график стандартного нормального распределения (μ=0, σ=1).
    
    Функция генерирует:
    1. Кривую плотности распределения
    2. Область под кривой (заливку)
    3. Вертикальную линию на среднем значении
    4. Подписи и заголовок
    """
    # Создаем диапазон значений по оси X
    x = np.linspace(-4, 4, 1000)
    
    # Вычисляем значения плотности вероятности
    y = norm.pdf(x, 0, 1)
    
    # Создаем график
    plt.figure(figsize=(10, 6))
    
    # Рисуем кривую распределения
    plt.plot(x, y, 'b-', linewidth=2, label='Плотность вероятности')
    
    # Заливаем область под кривой
    plt.fill_between(x, y, alpha=0.3)
    
    # Добавляем вертикальную линию на среднем значении
    plt.axvline(x=0, color='r', linestyle='--', alpha=0.5, label='μ = 0')
    
    # Добавляем линии стандартных отклонений
    for std in [-2, -1, 1, 2]:
        plt.axvline(x=std, color='gray', linestyle=':', alpha=0.3)
    
    # Настройка осей и заголовка
    plt.title('Стандартное нормальное распределение (μ=0, σ=1)', fontsize=14, pad=20)
    plt.xlabel('Значение', fontsize=12)
    plt.ylabel('Плотность вероятности', fontsize=12)
    plt.grid(True, alpha=0.3)
    plt.legend()
    
    # Устанавливаем пределы осей
    plt.xlim(-4, 4)
    plt.ylim(0, 0.45)
    
    # Добавляем аннотации с процентами
    plt.text(0, 0.42, '68.27%', ha='center', fontsize=9)
    plt.text(-1.5, 0.3, '95.45%', ha='center', fontsize=9)
    plt.text(1.5, 0.3, '99.73%', ha='center', fontsize=9)
    
    # Показываем график
    plt.show()

# Альтернативная версия с параметрами для кастомизации
def plot_normal_distribution_adv(mu=0, sigma=1, x_range=(-4, 4), figsize=(10, 6), 
                               show_fill=True, show_std_lines=True, show_percentages=True):
    """
    Усовершенствованная версия с параметрами для настройки.
    
    Параметры:
    mu : float - среднее значение (по умолчанию 0)
    sigma : float - стандартное отклонение (по умолчанию 1)
    x_range : tuple - диапазон значений по оси X (по умолчанию (-4, 4))
    figsize : tuple - размер графика (по умолчанию (10, 6))
    show_fill : bool - показывать заливку под кривой (по умолчанию True)
    show_std_lines : bool - показывать линии стандартных отклонений (по умолчанию True)
    show_percentages : bool - показывать процентные аннотации (по умолчанию True)
    """
    # Генерация значений
    x = np.linspace(x_range[0], x_range[1], 1000)
    y = norm.pdf(x, mu, sigma)
    
    # Создание графика
    plt.figure(figsize=figsize)
    
    # Кривая распределения
    plt.plot(x, y, 'b-', linewidth=2, 
             label=f'μ = {mu}, σ = {sigma}')
    
    # Заливка под кривой
    if show_fill:
        plt.fill_between(x, y, alpha=0.3)
    
    # Вертикальная линия на среднем
    plt.axvline(x=mu, color='r', linestyle='--', alpha=0.7)
    
    # Линии стандартных отклонений
    if show_std_lines:
        colors = ['green', 'orange', 'purple']
        for i, std in enumerate([1, 2, 3]):
            plt.axvline(x=mu + std*sigma, color=colors[i], linestyle=':', 
                       alpha=0.5, label=f'μ + {std}σ')
            plt.axvline(x=mu - std*sigma, color=colors[i], linestyle=':', 
                       alpha=0.5)
    
    # Настройки графика
    plt.title(f'Нормальное распределение: μ = {mu}, σ = {sigma}', 
              fontsize=14, pad=20)
    plt.xlabel('Значение', fontsize=12)
    plt.ylabel('Плотность вероятности', fontsize=12)
    plt.grid(True, alpha=0.3)
    plt.legend()
    
    # Автоматические пределы осей
    plt.xlim(x_range)
    plt.ylim(0, max(y)*1.1)
    
    # Процентные аннотации
    if show_percentages:
        # Вычисляем вероятности для интервалов
        probs = []
        for i in range(1, 4):
            prob = norm.cdf(mu + i*sigma, mu, sigma) - norm.cdf(mu - i*sigma, mu, sigma)
            probs.append(prob*100)
        
        # Добавляем аннотации
        plt.text(mu, max(y)*0.95, f'{probs[0]:.1f}%', ha='center', fontsize=9)
        plt.text(mu - 1.5*sigma, max(y)*0.7, f'{probs[1]:.1f}%', ha='center', fontsize=9)
        plt.text(mu + 1.5*sigma, max(y)*0.7, f'{probs[2]:.1f}%', ha='center', fontsize=9)
    
    plt.tight_layout()
    plt.show()

# Примеры использования:
if __name__ == "__main__":
    # Простой вариант
    plot_normal_distribution()
    
    # Продвинутый вариант с параметрами
    plot_normal_distribution_adv(mu=0, sigma=1, x_range=(-3.5, 3.5))
    
    # Нестандартное распределение
    plot_normal_distribution_adv(mu=5, sigma=2, x_range=(-1, 11))
```

## Требуемые установки:

```bash
pip install numpy matplotlib scipy
```

## Ключевые особенности:

1. **Базовая функция** `plot_normal_distribution()`:
   - Рисует стандартное нормальное распределение
   - Показывает заливку под кривой
   - Отмечает среднее значение и стандартные отклонения
   - Добавляет процентные аннотации

2. **Продвинутая функция** `plot_normal_distribution_adv()`:
   - Поддерживает произвольные μ и σ
   - Позволяет настраивать диапазон отображения
   - Имеет параметры для включения/выключения элементов
   - Автоматически вычисляет процентные доли

3. **Визуальные элементы**:
   - Синяя кривая плотности распределения
   - Красная пунктирная линия для среднего
   - Цветные линии стандартных отклонений
   - Полупрозрачная заливка под кривой
   - Сетка для лучшей читаемости
   - Процентные аннотации для стандартных интервалов

## Пример вывода:

График будет содержать:
- Колоколообразную кривую нормального распределения
- Вертикальную линию в точке x=0 (среднее)
- Линии на расстоянии 1σ, 2σ и 3σ от среднего
- Подписи с процентами данных в интервалах

Функции можно легко адаптировать для других распределений или визуализаций статистических данных.