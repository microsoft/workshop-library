import { ThreeDots } from 'react-loading-icons'
import './Loading.css'
export default function Loading() {
    return (
        <div className='Loading-container'>
            <ThreeDots className='loading' stroke="#fff" fill="#fff" />
        </div>
    )
}
