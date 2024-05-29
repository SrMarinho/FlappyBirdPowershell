# Carregar as assemblies necessárias do .NET
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Criar um novo formulário
$form = New-Object System.Windows.Forms.Form
$form.Text = "Jogo da Cobrinha"
$form.Size = New-Object System.Drawing.Size(400, 400)
# $form.StartPosition = "CenterScreen"
$form.StartPosition = "manual"
$form.Left = 2900 - $form.Width
$form.Top = 400
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false

# Configurações iniciais do jogo
$gridSize = 20
$snake = @([System.Drawing.Point]::new(5, 5))
$direction = "Right"
$food = [System.Drawing.Point]::new((Get-Random -Minimum 0 -Maximum 19), (Get-Random -Minimum 0 -Maximum 19))
$gameOver = $false

# Configurar o timer para atualizar o jogo
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 200
$timer.Add_Tick({
})

# Iniciar o jogo
$form.Add_Shown({
    $timer.Start()
    $graphics = $form.createGraphics()

    
    $graphics.Clear([System.Drawing.Color]::Black)

    $brush = new-object Drawing.SolidBrush red
    $graphics.FillRectangle($brush, 20, 20, 180, 180)

    $brush = new-object Drawing.SolidBrush green
    $graphics.FillEllipse($brush, 20, 20, 180, 180)
})

# Mostrar o formulário
[void]$form.ShowDialog()
