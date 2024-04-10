using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Btl_Ltw_De17_khaoSatTrucTuyen
{
    public class obj_traLoiForm
    {
        private int idTLF;
        private int idForm;
        private int idCauHoi;
        private int idCauTraLoi;
        private String noiDung;

        public obj_traLoiForm(int idTLF, int idForm, int idCauHoi, int idCauTraLoi, String noiDung)
        {
            this.IdTLF = idTLF;
            this.IdForm = idForm;
            this.IdCauHoi = idCauHoi;
            this.NoiDung = noiDung;
            this.idCauTraLoi = idCauTraLoi;

        }

        public int IdTLF { get => idTLF; set => idTLF = value; }
        public int IdForm { get => idForm; set => idForm = value; }
        public int IdCauHoi { get => idCauHoi; set => idCauHoi = value; }
        public String NoiDung { get => noiDung; set => noiDung = value; }
        public int IdCauTraLoi { get => idCauTraLoi; set => idCauTraLoi = value; }
    }
}