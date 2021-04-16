using System;
using System.Collections.Generic;

#nullable disable

namespace MediaInventory.Models
{
    public partial class Loan
    {
        public int LoanId { get; set; }
        public DateTime LoanOutDate { get; set; }
        public DateTime? LoanInDate { get; set; }
        public int BorrowerId { get; set; }
        public int MediaId { get; set; }
        public string Definition { get; set; }

        public virtual Borrower Borrower { get; set; }
        public virtual MediaInventory Media { get; set; }
    }
}
