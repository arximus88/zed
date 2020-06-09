let container = document.getElementById(`container`)
    texture = document.getElementById(`texture`)
    mask = document.getElementById(`mask`)
    size = `512px`
    color = `blue`
    horseId = `02`
    pose = `horses`
    resolution = `2048`
    poseTexture = `assets/${pose}_${horseId}_${resolution}.png`
    poseMask = `url('assets/${pose}_${horseId}.svg')`

mask.style.backgroundColor = color
mask.style.maskImage = poseMask
mask.style.webkitMaskImage = poseMask
texture.src = poseTexture
container.style.width = size
container.style.height = size