import { defineAsyncComponent } from 'vue'

export function loadView(view) {
    return () => import(`@/views/${view}`)
}

export function loadComponent(component){
    return defineAsyncComponent( () => import(`@/components/${component}`) )
}
