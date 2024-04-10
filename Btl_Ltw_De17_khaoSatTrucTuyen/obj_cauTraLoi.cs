using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Btl_Ltw_De17_khaoSatTrucTuyen
{
    public class obj_cauTraLoi
    {
        private int idCauTraLoi;
        private int idCauHoi;
        private String noiDung;

        public obj_cauTraLoi(int idCauTraLoi, int idCauHoi, string noiDung)
        {
            this.idCauTraLoi = idCauTraLoi;
            this.idCauHoi = idCauHoi;
            this.noiDung = noiDung;
        }

        public int IdCauTraLoi { get => idCauTraLoi; set => idCauTraLoi = value; }
        public int IdCauHoi { get => idCauHoi; set => idCauHoi = value; }
        public string NoiDung { get => noiDung; set => noiDung = value; }
    }
}