from escpos.printer import Usb

def print_image(image_path):
    """
    Print an image from the specified path on an Xprinter label printer.
    
    Args:
    image_path (str): The file path of the image to print.
    """
    # Xprinter USB Vendor ID and Product ID (example values, replace with your printer's IDs)
    VENDOR_ID = 0x1FC9  # replace with your printer's vendor ID
    PRODUCT_ID = 0x2016  # replace with your printer's product ID

    try:
        # Initialize USB printer object
        printer = Usb(VENDOR_ID, PRODUCT_ID)

        # Print image
        printer.image(image_path)
        printer.cut()

        print("Image has been printed successfully.")

    except Exception as e:
        print("Failed to print image:", str(e))

# Replace 'path_to_image.jpg' with the path to the image you want to print
print_image(r'D:\projects\Windows\Xprinter\code.jpg')
