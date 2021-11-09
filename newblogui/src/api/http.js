import axios from 'axios';

export function get(url,params) {
    return new Promise(((resolve, reject) => {
            axios.get(url,{
                params:params
            }).then(res => {
                resolve(res);
            }).catch( err => {
                reject(err)
            })
        }
    ))
}

export function post(url, params) {
    return new Promise((resolve, reject) => {
        axios.post(url, params)
            .then(res => {
                resolve(res);
            })
            .catch(err =>{
                reject(err)
            })
    });
}
