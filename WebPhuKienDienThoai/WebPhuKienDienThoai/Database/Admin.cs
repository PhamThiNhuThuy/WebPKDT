using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace WebPhuKienDienThoai.Database
{
    public class Admin
    {
        [Key]
        public int id_admin { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string admin_status { get; set; }

    }
}
