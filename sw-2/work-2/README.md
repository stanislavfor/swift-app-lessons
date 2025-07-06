### Оба проекта являются iOS-приложениями и имеют различия:
- LoginNoStoryboard не использует Storyboard, 
- LoginWithStoryboard использует Storyboard как основной UI.

#### Примечание:

В `LoginNoStoryboard` поле `UIMainStoryboardFile` и `UISceneStoryboardFile` пустые, 
так как UI будет создаваться вручную в `SceneDelegate`.

В `LoginWithStoryboard` явно указано имя storyboard - `Main`.