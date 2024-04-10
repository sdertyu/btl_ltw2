using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Btl_Ltw_De17_khaoSatTrucTuyen
{
    public class obj_themYK
    {
        private int id;
        private string email;
        private int idForm;

        public obj_themYK(int id, string email, int idForm)
        {
            this.id = id;
            this.email = email;
            this.idForm = idForm;
        }

        public int Id { get => id; set => id = value; }
        public string Email { get => email; set => email = value; }
        public int IdForm { get => idForm; set => idForm = value; }
    }
}