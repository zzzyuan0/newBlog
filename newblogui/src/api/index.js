export function getConfigsByProductId(productId) {
    return this.service({
        url: '/manager/getConfigsByProductId',
        params: { productId: productId }
    })
}

export function getAllAndroidPlugins() {
    return this.service({
        url: '/manager/getAndroidPlugin ',
        method: 'get'
    })
}
