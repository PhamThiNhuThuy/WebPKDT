using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebPhuKienDienThoai.Database
{
    public class Cart_Details
    {
        [Key]
        public int id_cart { get; set; }
        public string code_cart { get; set; }
        public int id_sanpham { get; set; }
        public int soluongmua { get; set; }
    }
}
