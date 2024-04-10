using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Btl_Ltw_De17_khaoSatTrucTuyen
{
    public class obj_taiKhoan
    {
        private String email;
        private String password;

        public obj_taiKhoan(string email, string password)
        {
            this.email = email;
            this.password = password;
        }



        public string Email { get => email; set => email = value; }
        public string Password { get => password; set => password = value; }
    }
}