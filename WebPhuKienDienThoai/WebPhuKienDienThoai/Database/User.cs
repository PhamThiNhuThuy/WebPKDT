using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebPhuKienDienThoai.Database
{
    public class User
    {
        [Key]
        public int id_users { get; set; }
        public string tenkhachhang { get; set; }
        public string email { get; set; }
        public string diachi { get; set; }
        public string matkhau { get; set; }
        public string dienthoai { get; set; }
    }
}
