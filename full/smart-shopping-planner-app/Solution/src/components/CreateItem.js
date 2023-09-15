import React, { useState } from 'react';
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import IconButton from '@mui/material/IconButton';
import MoreVertIcon from '@mui/icons-material/MoreVert';
import TextField from '@mui/material/TextField';
import CardContent from '@mui/material/CardContent';
import Box from '@mui/material/Box';
import { MenuItem, Button } from '@mui/material';
import { categories } from '../utils/Utils'
import Loading from './Loading';


function CreateItem({ fetchData }) {
    const [category, setCategory] = useState('');
    const [name, setName] = useState('');
    const [quantity, setQuantity] = useState('');
    const [unitPrice, setUnitPrice] = useState('');
    const [description, setDescription] = useState('');
    const [loading, setLoading] = useState(false);


    const createItemRequest = async () => {
        if (category === '' || name === '' || quantity === '' || unitPrice === '' || description === '') {  // check if all fields are filled
            alert('Please fill in all fields');
            return;
        } else {
            setLoading(true)  // start the loading
            try {
                const response = await fetch('/data-api/api/Item/', {  // fetch data from the API
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json', 'X-MS-API-ROLE': 'admin' },
                    body: JSON.stringify({ category, name, quantity, description, unitPrice })  // send the data to the API
                });
                const data = await response.json();
                if (response.ok) {
                    fetchData(); // refresh the list
                } else {
                    throw new Error(data.error.message);
                }
                setLoading(false) // stop the loading
            } catch (error) {
                console.error(error);
                setLoading(false)
            }
        }
    }

    const handleSubmit = async (event) => {
        event.preventDefault();   // prevent the default behavior of the form
        await createItemRequest();  // call the createItemRequest function

    };

    return (
        <Card>
            {loading && <Loading />}
            <CardHeader sx={{ '& .MuiTextField-root': { m: 1 }, }}
                action={<IconButton aria-label="settings"><MoreVertIcon /></IconButton>}
                title="Add Item"
            />
            <CardContent>
                <Box component="form" sx={{ '& .MuiTextField-root': { m: 1 }, }} noValidate autoComplete="on">
                    <TextField id="category" select label="Select" value={category} onChange={(e) => setCategory(e.target.value)}
                        helperText="Please select your category"
                        required >
                        {categories.map((option) => (
                            <MenuItem key={option.value} value={option.value}>
                                {option.label}
                            </MenuItem>
                        ))}
                    </TextField>
                    <TextField id="name" label="Item name" placeholder="New Item Name" multiline helperText="Please type in a new item name"
                        value={name}
                        onChange={(e) => setName(e.target.value)}
                        required
                    />
                    <TextField id="description" label="Item description" placeholder="Item Description" multiline
                        helperText="Please type in a a short description"
                        value={description}
                        onChange={(e) => setDescription(e.target.value)}
                        required
                    />
                    <TextField
                        id="unitPrice" label="Unit price in $" type='number' placeholder="Unit Price" multiline
                        helperText="Please add unit price"
                        value={unitPrice}
                        onChange={(e) => setUnitPrice(e.target.value)}
                        required
                    />
                    <TextField id="quantity" label="Quantity" type='number' placeholder="New Quantity" multiline
                        helperText="Please add quantity"
                        value={quantity}
                        onChange={(e) => setQuantity(e.target.value)}
                        required
                    />
                </Box>
                <Button type="submit" onClick={handleSubmit} size="small" variant="contained" color="primary" sx={{ p: 2 }}>Add</Button>
            </CardContent>
        </Card >

    );
}

export default CreateItem;