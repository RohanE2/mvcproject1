	const nav = document.querySelector('.main-nav');
			let scroll = 0;
			window.addEventListener('scroll',() =>{
				console.log(window.scrollY);
				if(window.scrollY > scroll){
					nav.classList.add('scrolled');
				}else{
					nav.classList.remove('scrolled');
				}
			scroll = window.scrollY;
			})