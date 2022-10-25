using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebPhuKienDienThoai.Database
{
    public class DanhMuc
    {
        [Key]
        public int id_danhmuc { get; set; }
        public string tendanhmuc { get; set; }
    }
}
