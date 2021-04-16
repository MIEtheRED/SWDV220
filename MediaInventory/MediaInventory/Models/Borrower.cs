using System;
using System.Collections.Generic;

#nullable disable

namespace MediaInventory.Models
{
    public partial class Borrower
    {
        public Borrower()
        {
            Loans = new HashSet<Loan>();
        }

        public int BorrowerId { get; set; }
        public string BorrowerName { get; set; }
        public string BorrowerPhone { get; set; }
        public string Definition { get; set; }

        public virtual ICollection<Loan> Loans { get; set; }
    }
}
