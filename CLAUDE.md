# Hamyon — учебный pet-проект

Глобальный справочник Asaka Mobile из `~/.claude/CLAUDE.md` к этому проекту не относится:
здесь свои архитектура, дизайн-система и навигация. Общие конвенции (без комментариев в коде) действуют.

## Цель
Учебный проект для закрепления знаний уровня Senior iOS.
Нативное iOS-приложение для учёта доходов и расходов.

## Как мне помогать
- Не пиши код фич за меня. Объясняй подход, задавай наводящие вопросы, давай подсказки.
- Код можно генерировать только для конфигов (CI, SwiftLint, Fastlane),
  бойлерплейта или когда я явно прошу.
- Когда я прошу ревью, смотри как тимлид: архитектура, потокобезопасность,
  утечки памяти, тестируемость, нейминг. Сначала самые важные проблемы.
- Объясняй «почему», а не только «как».
- Ключевые выводы дублируй на английском: я готовлюсь к собеседованиям.
- Отвечай коротко.

## Архитектура
- Clean Architecture + MVVM + Coordinators.
- Локальные SPM-пакеты: Domain, Data, Core, DesignSystem, Features.
- Domain не импортирует UIKit, SwiftUI и CoreData.
- Features зависят только от Domain и DesignSystem.
- Зависимости — через протоколы и constructor injection, без синглтонов.
- Swift 6 language mode, strict concurrency.
- Деньги всегда в Decimal.

## Процесс
- Один этап — одна ветка и один PR.
- Тесты пишутся вместе с кодом (Swift Testing, swift-snapshot-testing).

## Окружение
- Xcode 27.2, deployment target iOS 17.0 (ради `@Observable`). API новее 17 — только через `if #available`.
- Проект в новом формате `Hamyon.xcodeproj/project.xcproj`, папки синхронизируются сами.

## Команды
- Тесты: xcodebuild test -scheme Hamyon -destination 'platform=iOS Simulator,name=iPhone 18 Pro'
- Линтер: swiftlint
