package newmscwebsite

class TrailReport {
        TrailSection trailSection
        String comment
        String code
        
        static constraints = {
                comment(size: 0..2048)
        }

}
