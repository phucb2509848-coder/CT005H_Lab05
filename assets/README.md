Hướng dẫn tạo assets nhị phân

Thư mục này chứa các file base64 và script để tạo bản nhị phân:

- avatar.b64: base64 của file PNG avatar (placeholder)
- product.b64: base64 của file PNG sản phẩm (placeholder)
- sample.pdf: PDF mẫu (đã có thể mở trực tiếp)
- sample.mp4: video mẫu (sẽ được tải về bởi script)

Để tạo `avatar.png`, `product.png` và tải `sample.mp4`, chạy script PowerShell sau từ thư mục `scripts`:

```powershell
Set-Location 'd:\Nền tảng công nghệ số\CT005H_Lab05\scripts'
.
\generate_assets.ps1
```

Sau khi chạy, các file nhị phân nằm ở `assets/avatar.png`, `assets/product.png`, `assets/sample.mp4`.
