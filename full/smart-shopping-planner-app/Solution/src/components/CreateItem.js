import React, { useState } from 'react';
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import IconButton from '@mui/material/IconButton';
import MoreVertIcon from '@mui/icons-material/MoreVert';
import TextField from '@mui/material/TextField';
import CardContent from '@mui/material/CardContent';
import Box from '@mui/material/Box';
import { MenuItem, Button } from '@mui/material';

const categories = [
    {
      value: 'Utensils',
      label: 'Utensils',
    },
    {
      value: 'Furniture',
      label: 'Furniture',
    },
    {
      value: 'Kitchen Wear',
      label: 'Kitchen Wear',
    },
    {
      value: 'Bathroom Wear',
      label: 'Bathroom Wear',
    },
    {
        value: 'Food Items',
        label: 'Food Items',
    },
    {
        value: 'Office Wear',
        label: 'Office Wear',
    },
  ];

function CreateItem({ refetch }) {
    const [category, setCategory] = useState('');
    const [name, setName] = useState('');
    const [quantity, setQuantity] = useState('');
    const [description, setDescription] = useState('');


    const createItemRequest = async () => {
        try {
            const response = await fetch('/data-api/rest/Item', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-MS-API-ROLE' : 'admin',
                },
                body: JSON.stringify({
                    category,
                    name,
                    quantity,
                    description
                })
            });
            const data = await response.json();
            if (response.ok){
            } else {
                throw new Error(data.error.message);
            }
        } catch (error) {
            console.error(error);
        }
    }

    const handleSubmit = async (event) => {
        event.preventDefault();
        await createItemRequest();
        refetch();
    };

    return (
        <Card>
            <CardHeader
            sx={{
                    '& .MuiTextField-root': { m: 1 },
                }}
            action={
                <IconButton aria-label="settings">
                    <MoreVertIcon />
                </IconButton>
                }
                title="Add Item"
            />
            <CardContent>
                <Box
                component="form"
                sx={{
                    '& .MuiTextField-root': { m: 1 },
                }}
                noValidate
                autoComplete="on"
                >
                    <div>
                        <TextField
                        id="category"
                        select
                        label="Select"
                        defaultValue="EUR"
                        value={category}
                        onChange={(e) => setCategory(e.target.value)}
                        helperText="Please select your category"
                        >
                        {categories.map((option) => (
                            <MenuItem key={option.value} value={option.value}>
                            {option.label}
                            </MenuItem>
                        ))}
                        </TextField>
                    </div>
                    <div>
                        <TextField
                        id="name"
                        label="Item Name"
                        placeholder="New Item Name"
                        multiline
                        helperText="Please type in a new item name"
                        value={name}
                        onChange={(e) => setName(e.target.value)}
                        />
                    </div>
                    <div>
                        <TextField
                        id="description"
                        label="Item description"
                        placeholder="Item Description"
                        multiline
                        helperText="Please type in a a short description"
                        value={description}
                        onChange={(e) => setDescription(e.target.value)}
                        />
                    </div>
                    <div>
                    <TextField
                        id="quantity"
                        label="Quantity"
                        type='number'
                        placeholder="New Quantity"
                        multiline
                        helperText="Please add quantity"
                        value={quantity}
                        onChange={(e) => setQuantity(e.target.value)}
                        />
                    </div>
                </Box>
                <Button
                    type="submit"
                    onClick={handleSubmit}
                    size="small"
                    variant="contained"
                    color="primary"
                    sx={{ p: 2 }}
                >
                Add
                </Button>
                </CardContent>
        </Card>
        
    );
}

export default CreateItem;