using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Btl_Ltw_De17_khaoSatTrucTuyen
{
    public class obj_cauHoi
    {
        private int idCauHoi;
        private int idForm;
        private String noiDung;
        private String kieuCauHoi;
        private int count;
        private object v1;
        private string v2;
        private string v3;

        public obj_cauHoi(int idCauHoi, int idForm, string noiDung, String kieuCauHoi)
        {
            this.idCauHoi = idCauHoi;
            this.idForm = idForm;
            this.noiDung = noiDung;
            this.kieuCauHoi = kieuCauHoi;
        }

        public obj_cauHoi(int count, object v1, string v2, string v3)
        {
            this.count = count;
            this.v1 = v1;
            this.v2 = v2;
            this.v3 = v3;
        }

        public int IdCauHoi { get => idCauHoi; set => idCauHoi = value; }
        public int IdForm { get => idForm; set => idForm = value; }
        public string NoiDung { get => noiDung; set => noiDung = value; }
        public String KieuCauHoi { get => kieuCauHoi; set => kieuCauHoi = value; }
    }
}