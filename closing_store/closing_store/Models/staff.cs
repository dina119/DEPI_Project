//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace closing_store.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class staff
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public staff()
        {
            this.customer_service = new HashSet<customer_service>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public string password { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<customer_service> customer_service { get; set; }
    }
}
