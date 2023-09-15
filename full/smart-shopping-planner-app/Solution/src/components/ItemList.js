import React, { useState, useEffect } from 'react';
import Paper from '@mui/material/Paper';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Card from '@mui/material/Card';
import { Button } from '@mui/material';
import Loading from './Loading';

const ItemList = ({ fetchData, items }) => {
    const [loading, setLoading] = useState(false);

    const deleteItem = async (id) => {
        setLoading(true)   // start the loading
        try {
            const response = await fetch('/data-api/api/Item/id/${id}', {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'X-MS-API-ROLE': 'admin',
                }
            });
            if (!response.ok) {
                throw new Error(response.statusText);
            }
            await fetchData(true);   // refresh the list
            setLoading(false)   // stop the loading
        } catch (error) {
            console.error(error);
            setLoading(false)   // stop the loading
        }
    }

    useEffect(() => {
        setLoading(true)  // start the loading
        fetchData();   // fetch the data once the page loads[componentDidMount]
        setLoading(false)
    }, []);

    return (
        <div className='item-list'>
            {loading && <Loading />}
            <Card>
                <TableContainer component={Paper}>
                    <Table aria-label="simple table">
                        <TableHead>
                            <TableRow>
                                <TableCell>Category</TableCell>
                                <TableCell>Name</TableCell>
                                <TableCell>Quantity</TableCell>
                                <TableCell>Description</TableCell>
                                <TableCell>Unit Price</TableCell>
                            </TableRow>
                        </TableHead>
                        <TableBody>
                            {items.map((item) => (
                                <TableRow
                                    key={item.id}
                                    sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
                                >
                                    <TableCell component="th" scope="row">
                                        {item.category}
                                    </TableCell>
                                    <TableCell>{item.name}</TableCell>
                                    <TableCell>{item.quantity}</TableCell>
                                    <TableCell>{item.description}</TableCell>
                                    <TableCell>${item.unitPrice}</TableCell>
                                    <TableCell>
                                        <Button variant="contained" color="error" onClick={() => deleteItem(item.id)}>Delete</Button>
                                    </TableCell>
                                </TableRow>
                            ))}
                        </TableBody>
                    </Table>
                </TableContainer>
            </Card>
        </div>
    );
};

export default ItemList;