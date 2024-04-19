# Set the path to the image file
$imagePath = "D:\projects\Windows\Xprinter\img\collage.jpg"

# Load necessary .NET assembly for drawing and printing
Add-Type -AssemblyName System.Drawing

# Create a new PrintDocument object
$printDocument = New-Object System.Drawing.Printing.PrintDocument

# Define the custom paper size (58mm x 40mm)
$customPaperSize = New-Object System.Drawing.Printing.PaperSize("Custom", 228, 157)  # Width and Height in hundredths of an inch
$printDocument.DefaultPageSettings.PaperSize = $customPaperSize

# Set the printer name if it's specifically needed (optional, if not default)
# $printDocument.PrinterSettings.PrinterName = "Xprinter XP-370B"

# Define what happens when the document is about to be printed
$printDocument.add_PrintPage({
    param($sender, $e)
    $image = [System.Drawing.Image]::FromFile($imagePath)
    # Ensure the image fits within the print area
    $scale = [Math]::Min($e.PageBounds.Width / $image.Width, $e.PageBounds.Height / $image.Height)
    $scaledWidth = $image.Width * $scale
    $scaledHeight = $image.Height * $scale
    # Center the image
    $startX = ($e.PageBounds.Width - $scaledWidth) / 2
    $startY = ($e.PageBounds.Height - $scaledHeight) / 2
    $e.Graphics.DrawImage($image, $startX, $startY, $scaledWidth, $scaledHeight)
    $image.Dispose()
})

# Print the document
$printDocument.Print()


