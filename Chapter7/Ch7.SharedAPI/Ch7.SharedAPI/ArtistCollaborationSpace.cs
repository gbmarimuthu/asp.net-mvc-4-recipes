//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Ch7.SharedAPI
{
    using System;
    using System.Collections.Generic;
    
    public partial class ArtistCollaborationSpace
    {
        public int ArtistCollaborationSpaceId { get; set; }
        public int ArtistId { get; set; }
        public int CollaborationSpaceId { get; set; }
        public bool IsCreator { get; set; }
        public System.DateTime FirstContributionDate { get; set; }
        public System.DateTime LastContributionDate { get; set; }
        public string Note { get; set; }
    
        public virtual Artist Artist { get; set; }
        public virtual CollaborationSpace CollaborationSpace { get; set; }
    }
}