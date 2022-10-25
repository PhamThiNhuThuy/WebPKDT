using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebPhuKienDienThoai.Models
{
    public class SanPhamAddModel
    {

        [Required(ErrorMessage = "Vui lòng nhập tên sản phẩm")]
        [MaxLength(255, ErrorMessage = "Tên sản phẩm không được quá 255 ký tự")]
        public string tensanpham { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mã sản phẩm")]
        public string masp { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập giá sản phẩm")]
        public string giasp { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số lượng")]
        public int soluong { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập hình ảnh")]
        public string hinhanh { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập tóm tắt")]
        public string tomtat { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập tình trạng")]
        public int tinhtrang { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập id danh mục")]
        public int id_danhmuc { get; set; }
    }
}