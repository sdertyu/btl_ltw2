using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Btl_Ltw_De17_khaoSatTrucTuyen
{
    public class obj_formKS
    {
        private int idForm;
        private String email;
        private String tenForm;
        private String moTa;

        public obj_formKS() { }

        public obj_formKS(int idForm, string email, string tenForm, string moTa)
        {
            this.idForm = idForm;
            this.email = email;
            this.tenForm = tenForm;
            this.moTa = moTa;
        }

        public string Email { get => email; set => email = value; }
        public string TenForm { get => tenForm; set => tenForm = value; }
        public string MoTa { get => moTa; set => moTa = value; }
        public int IdForm { get => idForm; set => idForm = value; }
    }
}