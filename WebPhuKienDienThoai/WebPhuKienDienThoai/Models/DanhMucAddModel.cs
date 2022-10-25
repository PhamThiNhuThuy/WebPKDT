using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebPhuKienDienThoai.Models
{
    public class DanhMucAddModel
    {
        [Required(ErrorMessage = "Vui lòng nhập tên danh mục")]
        [MaxLength(255, ErrorMessage = "Tên danh mục không được quá 255 ký tự")]
        public string tendanhmuc { get; set; }
    }
}
