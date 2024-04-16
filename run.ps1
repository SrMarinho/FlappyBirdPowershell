Using module ./gameEngine.psm1


function main () {
  Clear-Host

  # [Console]::BackgroundColor = "DarkCyan"

  [Console]::CursorVisible = $false

  $windowWidth = $Host.UI.RawUI.WindowSize.Width
  $windowHeight = $Host.UI.RawUI.WindowSize.Height

  # Exemplo de uso
  $gameEngine = [GameEngine]::new($windowWidth, $windowHeight)
  $gameEngine.run()
}

main
