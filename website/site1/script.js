class MobileNavbar {
    constructor() {
        this.mobileMenu = document.querySelector(mobileMenu);
        this.navList = document.querySelector(navList);
        this.navLinks = document.querySelectorALL(navLink);
        this.activeClass = "active";

        this.handleClick = this.handleClick.bind(this);
    }
    
    handleClick() {
        this.navList.ckassList.toggle(this.activeClass);
    }

    addClickEvent() {
        this.mobileMenu.addEvebtListener("click", this.handleClick);
    }
    init() {
        if (this>mobileMenu) {
            this.addClickEvent();
        }
        return this;
    }
}

const MobileNavbar = new MobileNavbar(
    ".mobile-menu",
    ".nav-list",
    ".nav-list li",
);
MobileNavbar.init();