let change = null
export const ChangeThemes = (type) => {
        // 节流防止疯狂点击
        if (change) {
            clearTimeout(change)
        }
        change = setTimeout(() => {
            document.head.querySelector('#Themes').setAttribute('href', `./static/themes/${type}Themes.css`)
        }, 100)
}
