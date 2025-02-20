<script setup>
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';

const props = defineProps({
    user: {
        type: Object,
        required: true,
    }
});

const form = useForm({
    email: "",
    money: 0
});

const submit = () => {
    form.post("/transfert");
}

</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2
                class="text-xl font-semibold leading-tight text-gray-800"
            >
                Dashboard
            </h2>
        </template>

        <div class="py-12">
            <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
                <div
                    class="overflow-hidden bg-white shadow-sm sm:rounded-lg"
                >
                    <div class="p-6 text-gray-900">
                        You're logged in!
                    </div>
                </div>
            </div>
        </div>
        <div>
            
            <form @submit.prevent="submit" class="flex flex-col w-56 mx-auto">
                <p>Ton argent : {{ props.user.money }}</p>
                <h1>Tranfert money</h1>
                <TextInput 
                    v-model="form.email" type="email" required placeholder="Email of account"
                />
                <TextInput 
                    v-model="form.money" type="number" required
                />
                <PrimaryButton type="submit">Submit</PrimaryButton>
            </form>
        </div>
    </AuthenticatedLayout>
</template>
